namespace MandiERP.Abstractions.Master
{
    public class ItemUnitsDto
    {
        public int Id { get; set; }
        public int? ItemUnitNo { get; set; }
        public string? ItemUnit { get; set; }
        public string? ItemUnitHindi { get; set; }
        public int? RateOfUnitinKgs { get; set; }
        public decimal? PercentComission { get; set; }
        public decimal? WeightCuttingPerUnit { get; set; }
        public decimal? HammaliPerUnit { get; set; }
        public decimal? TulaiPerUnit { get; set; }
        public decimal? KhadiKariPerUnit { get; set; }
        public decimal? WeightCuttingPerUnit1 { get; set; }
        public decimal? HammaliPerUnit1 { get; set; }
        public decimal? TulaiPerUnit1 { get; set; }
        public decimal? KhadiKariPerUnit1 { get; set; }
        public decimal? WeightCuttingPerUnit2 { get; set; }
        public decimal? HammaliPerUnit2 { get; set; }
        public decimal? TulaiPerUnit2 { get; set; }
        public decimal? KhadiKariPerUnit2 { get; set; }
        public decimal? WeightCuttingPerUnit4 { get; set; }
        public decimal? HammaliPerUnit4 { get; set; }
        public decimal? TulaiPerUnit4 { get; set; }
        public decimal? KhadiKariPerUnit4 { get; set; }
        public int? FkBranchId { get; set; }
        public string? IsActive { get; set; }
        public int? CreateBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public DateTime? Sysdate { get; set; }
    }
}
