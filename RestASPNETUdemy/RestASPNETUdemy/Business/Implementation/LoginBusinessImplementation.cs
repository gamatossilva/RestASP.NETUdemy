using RestASPNETUdemy.Model;
using RestASPNETUdemy.Repository;
using RestASPNETUdemy.Security.Configuration;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;

namespace RestASPNETUdemy.Business.Implementation
{
    public class LoginBusinessImplementation : ILoginBusiness
    {
        private IUserRepository _repository;
        private SigninConfigurations _signinConfigurations;
        private TokenConfiguration _tokenConfiguration;

        public LoginBusinessImplementation(IUserRepository repository, SigninConfigurations signinConfigurations, TokenConfiguration tokenConfiguration) {
            _repository = repository;
            _signinConfigurations = signinConfigurations;
            _tokenConfiguration = tokenConfiguration;
        }

        public object FindByLogin(User user) {
            bool credentialsIsValid = false;
            if(user != null && !string.IsNullOrWhiteSpace(user.Login)) {
                var baseUser = _repository.FindByLogin(user.Login);
                credentialsIsValid = (baseUser != null && user.Login == baseUser.Login && user.AccessKey == baseUser.AccessKey);
            }
            if (credentialsIsValid) {
                ClaimsIdentity identity = new ClaimsIdentity(
                    new GenericIdentity(user.Login, "Login"),
                    new[] {
                        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString("N")),
                        new Claim(JwtRegisteredClaimNames.UniqueName, user.Login)

                    });
                DateTime createDate = DateTime.Now;
                DateTime expirationDate = createDate + TimeSpan.FromSeconds(_tokenConfiguration.Seconds);

                var handler = new JwtSecurityTokenHandler();
                string token = CreateToken(identity, createDate, expirationDate, handler);
                return SuccessObject(createDate, expirationDate, token);
            } else {
                return ExceptionObject();
            }
        }

        private string CreateToken(ClaimsIdentity identity, DateTime createDate, DateTime expirationDate, JwtSecurityTokenHandler handler) {
            var securityToken = handler.CreateToken(new Microsoft.IdentityModel.Tokens.SecurityTokenDescriptor {
                Issuer = _tokenConfiguration.Issuer,
                Audience = _tokenConfiguration.Audience,
                SigningCredentials = _signinConfigurations.SigningCredentials,
                Subject = identity,
                NotBefore = createDate,
                Expires = expirationDate
            });
            var token = handler.WriteToken(securityToken);
            return token;
        }

        private object ExceptionObject() {
            return new {
                autenticated = false,
                message = "Failed to authenticate"
            };
        }

        private object SuccessObject(DateTime createDate, DateTime expirationDate, string token) {
            return new {
                autenticated = true,
                created = createDate.ToString("yyyy-MM-dd HH:mm:ss"),
                expiration = expirationDate.ToString("yyyy-MM-dd HH:mm:ss"),
                accesToken = token,
                message = "OK"
            };
        }
    }
}
