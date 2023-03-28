
using ProjectFinal.Models;
using System.Text.Json;
namespace ProjectFinal.DataService
{
    public class Author
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public Author(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }
        public Boolean IsAuthor(int role)
        {
            var userJ = _httpContextAccessor.HttpContext.Session.GetString("user");
            User user;
            if (userJ == null)
            {
                return false;
            }
            else
            {
                user = JsonSerializer.Deserialize<User>(userJ);
            }
            if (user == null)
            {
                return false;
            }
            else
            {
                if (user.Role == 1)
                {
                    return true;
                }
                else
                {
                    if (user.Role == role)
                    {
                        return true;
                    }
                }
                
            }
            return false;
        }
    }
}
