using CRUD_Operation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD_Operation.Controllers
{
    public class HomeController : Controller
    {
        PrasantEntities db = new PrasantEntities();
        public ActionResult Index()
        {
            var data=db.Product_Master.ToList();
            return View(data);
        }
        [HttpGet]
        public ActionResult Create()
        {
            List<Tbl_Catagory> Catagorylist = db.Tbl_Catagory.ToList();
            ViewBag.Cors1 = new SelectList(Catagorylist, "Id", "Id");
            ViewBag.Cors2 = new SelectList(Catagorylist, "Id", "Catagory_Name");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Product_Master p)
        {
            List<Tbl_Catagory> Catagorylist = db.Tbl_Catagory.ToList();
            ViewBag.Cors1 = new SelectList(Catagorylist, "Id", "Id");
            ViewBag.Cors2 = new SelectList(Catagorylist, "Id", "Catagory_Name");
            db.Product_Master.Add(p);
            db.SaveChanges();
            ViewBag.message = "Data Insert Succcessfuly";
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var data = db.Product_Master.Where(x => x.ProductId == id).FirstOrDefault();
            
            List<Tbl_Catagory> Catagorylist = db.Tbl_Catagory.ToList();
            ViewBag.Cors1 = new SelectList(Catagorylist, "Id", "Id");
            ViewBag.Cors2 = new SelectList(Catagorylist, "Id", "Catagory_Name");

            return View(data);
        }
        [HttpPost]
        public ActionResult Edit(Product_Master p)
        {
            var data = db.Product_Master.Where(x => x.ProductId == p.ProductId).FirstOrDefault();
            if (data != null)
            {
                data.ProductName = p.ProductName;
                data.Catagory_Id = p.Catagory_Id;
                data.Catagory = p.Catagory;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            var data = db.Product_Master.Where(x => x.ProductId == id).FirstOrDefault();
            db.Product_Master.Remove(data);
            db.SaveChanges();
            ViewBag.Message = "record delete successfully";
            return RedirectToAction("Index");
        }
    }
}