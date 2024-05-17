using MandiERP.Abstractions.Service;
using Microsoft.Extensions.DependencyInjection;

namespace MandiERP.Service
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services.AddScoped<IItemTypeService, ItemTypeService>();
            services.AddScoped<IVillageService, VillageService>();

            return services;
        }
    }
}