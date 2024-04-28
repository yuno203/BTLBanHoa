using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddCors(option =>
{
    option.AddPolicy("MyCors", build =>
    {
        build.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();
    });
});

// Add services to the container.
builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();
//builder.Services.AddTransient<IKhachRepository, KhachRepository>();
//builder.Services.AddTransient<IKhachBusiness, KhachBusiness>();
builder.Services.AddTransient<IHoaDonBusiness, HoaDonBusiness>();
builder.Services.AddTransient<IHoaDonRepository, HoaDonRepository>();
//builder.Services.AddTransient<IThongKeBusiness, ThongKeBusiness>();
//builder.Services.AddTransient<IThongKeRepository, ThongKeRepository>();
//builder.Services.AddTransient<IHoaDonNhapBusiness, HoaDonNhapBusiness>();
//builder.Services.AddTransient<IHoaDonNhapRepository, HoaDonNhapRepository>();
builder.Services.AddTransient<IUserBusiness, UserBusiness>();
builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<ISanPhamBusiness, SanPhamBusiness>();
builder.Services.AddTransient<ISanPhamRepository, SanPhamRepository>();
builder.Services.AddTransient<IChuyenMucBusiness, ChuyenMucBusiness>();
builder.Services.AddTransient<IChuyenMucRepository, ChuyenMucRepository>();


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// configure strongly typed settings objects
IConfiguration configuration = builder.Configuration;
var appSettingsSection = configuration.GetSection("AppSettings");
builder.Services.Configure<AppSettings>(appSettingsSection);
// configure jwt authentication
var appSettings = appSettingsSection.Get<AppSettings>();
var key = Encoding.ASCII.GetBytes(appSettings.Secret);
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("MyCors");
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();


