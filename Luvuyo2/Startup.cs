using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Luvuyo2.Startup))]
namespace Luvuyo2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }

}
