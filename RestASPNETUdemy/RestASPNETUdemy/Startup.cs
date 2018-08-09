using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using RestASPNETUdemy.Model.Context;
using RestASPNETUdemy.Business;
using RestASPNETUdemy.Business.Implementation;
using RestASPNETUdemy.Repository;
using RestASPNETUdemy.Repository.Generic;
using Microsoft.Net.Http.Headers;
using Tapioca.HATEOAS;
using RestASPNETUdemy.Hypermedia;
using Swashbuckle.AspNetCore.Swagger;
using Microsoft.AspNetCore.Rewrite;
using RestASPNETUdemy.Security.Configuration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using RestASPNETUdemy.Repository.Implementation;

namespace RestASPNETUdemy
{
    public class Startup
    {
        private readonly ILogger _logger;
        public IConfiguration _configuration { get; }
        public IHostingEnvironment _environment { get; }

        public Startup(IConfiguration configuration, IHostingEnvironment environment, ILogger<Startup> logger)
        {
            _configuration = configuration;
            _environment = environment;
            _logger = logger;
        }

        

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            var connectionString = _configuration["MySqlConnection:MySqlConnectionString"];
            services.AddDbContext<MySQLContext>(options => options.UseMySql(connectionString));

            if (_environment.IsDevelopment()) {
                try {
                    var evolveConnection = new MySql.Data.MySqlClient.MySqlConnection(connectionString);
                    var evolve = new Evolve.Evolve("evolve.json", evolveConnection, msg => _logger.LogInformation(msg)) {
                        Locations = new List<string> { "db/migrations" },
                        IsEraseDisabled = true,
                    };

                    evolve.Migrate();

                } catch(Exception ex) {
                    _logger.LogCritical("Database migration failed.", ex);
                    throw;
                }
            }

            var siginConfigurations = new SigninConfigurations();
            services.AddSingleton(siginConfigurations);

            var tokenConfiguration = new TokenConfiguration();

            new ConfigureFromConfigurationOptions<TokenConfiguration>(
                _configuration.GetSection("TokenConfiguration")).Configure(tokenConfiguration);
            services.AddSingleton(tokenConfiguration);

            services.AddAuthentication(authOptions => {
                authOptions.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                authOptions.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(bearerOptions => {
                var paramsValidation = bearerOptions.TokenValidationParameters;
                paramsValidation.IssuerSigningKey = siginConfigurations.Key;
                paramsValidation.ValidAudience = tokenConfiguration.Audience;
                paramsValidation.ValidIssuer = tokenConfiguration.Issuer;

                paramsValidation.ValidateIssuerSigningKey = true;

                paramsValidation.ValidateLifetime = true;

                paramsValidation.ClockSkew = TimeSpan.Zero;
            });

            services.AddAuthorization(auth => {
                auth.AddPolicy("Bearer", new AuthorizationPolicyBuilder()
                    .AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme)
                    .RequireAuthenticatedUser().Build());
            });
           

            services.AddMvc(options => {
                options.RespectBrowserAcceptHeader = true;
                options.FormatterMappings.SetMediaTypeMappingForFormat("xml", MediaTypeHeaderValue.Parse("text/xml"));
                options.FormatterMappings.SetMediaTypeMappingForFormat("json", MediaTypeHeaderValue.Parse("application/json"));
            })
            .AddXmlSerializerFormatters();

            var filterOptions = new HyperMediaFilterOptions();
            //filterOptions.ObjectContentResponseEnricherList.Add(new PersonEnricher());
            //filterOptions.ObjectContentResponseEnricherList.Add(new BookEnricher());
            services.AddSingleton(filterOptions);

            services.AddApiVersioning(option => option.ReportApiVersions = true);

            services.AddSwaggerGen(c => {
                c.SwaggerDoc("v1", 
                    new Info {
                        Title = "RESTful API with ASP.NET Core 2.0",
                        Version = "v1"
                    });
            });

            //Dependency Injection
            services.AddScoped<IPersonBusiness, PersonBusinessImplementation>();
            services.AddScoped<IBookBusiness, BookBusinessImplementation>();
            services.AddScoped<ILoginBusiness, LoginBusinessImplementation>();
            services.AddScoped<IFileBusiness, FileBusinessImplementation>();

            services.AddScoped<IUserRepository, UserRepositoryImplementation>();
            services.AddScoped<IPersonRepository, PersonRepositoryImplementation>();

            services.AddScoped(typeof(IRepository<>), typeof(GenericRepository<>));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(c => {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API v1");
            });

            var option = new RewriteOptions();

            option.AddRedirect("^$", "swagger");

            app.UseRewriter(option);

            app.UseMvc(routes => {
                routes.MapRoute(
                    name: "DefaultApi",
                    template: "{controller=Values}/{id?}"
                    );
            });
        }
    }
}
