using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Master;
using MandiERP.Core.Abstraction;
using Microsoft.Data.SqlClient;

namespace MandiERP.Service.MapperProfile
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ItemType, ItemTypeDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.ItemTypeId))
                // Additional mappings as needed
                .ReverseMap();

            CreateMap<Village, VillageDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.VillageID))
                .ReverseMap();

            CreateMap<ItemUnits, ItemUnitsDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.ItemUnitID))
                .ReverseMap();

            CreateMap<Account, AccountDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.AccountID))
                .ReverseMap();

            CreateMap<AccountTypes, AccountTypesDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.AccountTypeID))
                .ReverseMap();

            CreateMap<ItemSaleRateDiff, ItemSaleRateDiffDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.ItemSaleRateDiffID))
                .ReverseMap();

            CreateMap<ItemWeightDetails, ItemWeightDetailsDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.ItemWeightDetailID))
                .ReverseMap();

            CreateMap<ItemSaleDetails, ItemSaleDetailsDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.ItemSaleDetailID))
                .ReverseMap();
            CreateMap<BillDetails, BillDetailsDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.BillDetailID))
                .ReverseMap();
            CreateMap<GadiMaster, GadiMasterDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.GadiMasterID))
                .ReverseMap();
            CreateMap<AccountBankDetail, AccountBankDetailDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.AccountBankDetailID))
                .ReverseMap();

        }
    }
}
