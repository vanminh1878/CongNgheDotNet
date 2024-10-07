using Bài_tập_4.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bài_tập_4.Controllers
{
    public class CatalogController : Controller
    {
        // GET: Catalog
        public ActionResult Index()
        {
            string connectionString = "LAPTOP-R8PRJ8TP\\SQLEXPRESS";
            QuanLySanPhamDataContext context = new QuanLySanPhamDataContext(connectionString);
            List<Catalog> dsCatalog = context.Catalogs.ToList();
            return View(dsCatalog);
        }
    }
}