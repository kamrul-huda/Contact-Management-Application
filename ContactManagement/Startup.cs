using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ContactManagement.Startup))]
namespace ContactManagement
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
