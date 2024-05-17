using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Core.Abstraction;

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
        }
    }
}
