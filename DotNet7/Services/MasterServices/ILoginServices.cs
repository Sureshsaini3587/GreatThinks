using DotNet7.Models.Login;

namespace DotNet7.Services.MasterServices
{
    public interface ILoginServices
    {
        public List<UserDetails> Login(string username, string password);
    }
}
