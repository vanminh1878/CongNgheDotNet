using Microsoft.EntityFrameworkCore;
using WebBanHang.Models;
using WebBanHang.Repository;

namespace WebBanHang
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            //var connectionString = builder.Configuration.GetConnectionString("QLBanVaLiContext");
           // var connectionString = "Data Source=LAPTOP-R8PRJ8TP\\SQLEXPRESS;Initial Catalog=QLBanVaLi;Integrated Security=True;Trust Server Certificate=True";
            var connectionString = "Data Source=LAPTOP-R8PRJ8TP;Initial Catalog=QLBanVaLi;Integrated Security=True;Trust Server Certificate=True";
            builder.Services.AddDbContext<QLBanVaLiContext>(x => x.UseSqlServer(connectionString));
            builder.Services.AddScoped<ILoaiSpRepository, LoaiSpRepository>();
            builder.Services.AddSession();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseSession();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Access}/{action=Login}/{id?}");

            app.Run();
        }
    }
}