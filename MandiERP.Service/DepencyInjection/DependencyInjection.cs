using MandiERP.Abstractions.Service;
using MandiERP.Abstractions.Service.Master.ItemUnit;
using Microsoft.Extensions.DependencyInjection;

namespace MandiERP.Service
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services.AddScoped<IItemTypeService, ItemTypeService>();
            services.AddScoped<IVillageService, VillageService>();
            services.AddScoped<IItemUnitService, ItemUnitService>();
            services.AddScoped<IAccountService, AccountService>();
            services.AddScoped<IAccountTypeService, AccountTypeService>();
            services.AddScoped<IItemSaleRateDiffService, ItemSaleRateDiffService>();
            services.AddScoped<IItemWeightDetailService, ItemWeightDetailService>();
            services.AddScoped<IItemSaleDetailService, ItemSaleDetailService>();
            services.AddScoped<IBillDetailsService, BillDetailsService>();
            services.AddScoped<IGadiMasterService, GadiMasterService>();
            services.AddScoped<IAccountBankDetailService, AccountBankDetailService>();

            return services;
        }
    }
}