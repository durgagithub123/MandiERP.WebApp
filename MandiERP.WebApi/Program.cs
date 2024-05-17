using AutoMapper;
using MandiERP.Persistence;
using MandiERP.Service;
using MandiERP.Service.MapperProfile;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
//builder.Services.AddControllers()
//.AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<Startup>());

builder.Services.AddPersistenceServices(builder.Configuration);
builder.Services.AddServices();

//builder.Services.AddAutoMapper(typeof(Startup));
var mapperConfig = new MapperConfiguration(mc =>
{
    mc.AddProfile(new MappingProfile());
});
IMapper mapper = mapperConfig.CreateMapper();
builder.Services.AddSingleton(mapper);

builder.Services.AddLogging();


// Register services, repositories, validators, and other dependencies
//builder.Services.AddScoped<IItemTypeRepository, ItemTypeRepository>();
//builder.Services.AddScoped<IItemTypeService, ItemTypeService>();

builder.Services.AddHttpContextAccessor();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();

//app.UseAuthorization();
app.UseAuthentication();
app.UseAuthorization();

app.UseCors();
app.UseCors(builder =>
{
    builder
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader();
});

app.MapControllers();
//app.UseExceptionHandler();
app.Run();

//app.LoggerFactory.AddFile("Logs/myapp-{Date}.txt");
