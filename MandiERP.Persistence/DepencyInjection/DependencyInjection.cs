using MandiERP.Abstractions.Repository;
using MandiERP.DataLayer;
using MandiERP.Persistence.Master;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace MandiERP.Persistence
{

    public static class DependencyInjection
    {
        public static IServiceCollection AddPersistenceServices(this IServiceCollection services, IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("MandiERPConnectionString");
            services.AddDbContext<MandiERPDbContext>
                  (o => o.UseSqlServer(connectionString));


            services.AddScoped<IItemTypeRepository, ItemTypeRepository>();
            services.AddScoped<IVillageRepository, VillageRepository>();
            services.AddScoped<IItemUnitRepository, ItemUnitRepository>();
            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<IAccountTypeRepository, AccountTypeRepository>();
            services.AddScoped<IItemSaleRateDiffRepository, ItemSaleRateDiffRepository>();
            services.AddScoped<IItemWeightDetailRepository, ItemWeightDetailRepository>();
            services.AddScoped<IItemSaleDetailRepository, ItemSaleDetailRepository>();
            services.AddScoped<IBillDetailsRepository, BillDetailsRepository>();
         

            #region for Reference

            //Guard.Against.Null(connectionString, message: "Connection string 'DefaultConnection' not found.");


            //            services.AddDbContext<ApplicationDbContext>((sp, options) =>
            //            {
            //                options.AddInterceptors(sp.GetServices<ISaveChangesInterceptor>());

            //#if (UseSQLite)
            //            options.UseSqlite(connectionString);
            //#else
            //                options.UseSqlServer(connectionString);
            //#endif
            //            });

            //            services.AddScoped<IApplicationDbContext>(provider => provider.GetRequiredService<ApplicationDbContext>());

            //            services.AddScoped<ApplicationDbContextInitialiser>();

            //#if (UseApiOnly)
            //        services.AddAuthentication()
            //            .AddBearerToken(IdentityConstants.BearerScheme);

            //        services.AddAuthorizationBuilder();

            //        services
            //            .AddIdentityCore<ApplicationUser>()
            //            .AddRoles<IdentityRole>()
            //            .AddEntityFrameworkStores<ApplicationDbContext>()
            //            .AddApiEndpoints();
            //#else
            //            services
            //                .AddDefaultIdentity<ApplicationUser>()
            //                .AddRoles<IdentityRole>()
            //                .AddEntityFrameworkStores<ApplicationDbContext>();
            //#endif

            //            services.AddSingleton(TimeProvider.System);
            //            services.AddTransient<IIdentityService, IdentityService>();

            //            services.AddAuthorization(options =>
            //                options.AddPolicy(Policies.CanPurge, policy => policy.RequireRole(Roles.Administrator)));
            #endregion
            return services;
        }
    }
}
