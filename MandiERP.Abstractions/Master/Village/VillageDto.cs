namespace MandiERP.Abstractions.Master
{
    public class VillageDto
    {
        public int Id { get; set; }
        public int? VillageNo { get; set; }
        public string VillageName { get; set; }
        public string VillageNameHindi { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Address { get; set; }
        public int? FkBranchId { get; set; }
        public string IsActive { get; set; }
        public int? CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
    }
}
