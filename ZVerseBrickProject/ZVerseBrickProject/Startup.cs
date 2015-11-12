using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ZVerseBrickProject.Startup))]
namespace ZVerseBrickProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
