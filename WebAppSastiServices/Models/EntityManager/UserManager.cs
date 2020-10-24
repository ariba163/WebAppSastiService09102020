using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAppSastiServices.Models.DB;

namespace WebAppSastiServices.Models.EntityManager
{
    
    public static class UserManager
    {

        public static bool IsEmailExist(string emailID)
        {
            using (SastaServicesDBEntities db = new SastaServicesDBEntities())
            {
                var v = db.StpUsers.Where(a => a.EmailID == emailID).FirstOrDefault();
                return v != null;
            }
        }

        public static bool IsUsernameExist(string username)
        {
            using (SastaServicesDBEntities db = new SastaServicesDBEntities())
            {
                var v = db.StpUsers.Where(a => a.UserName == username).FirstOrDefault();
                return v != null;
            }
        }
        public static string GetHashedPassByUsername(string username)
        {
            using (SastaServicesDBEntities db = new SastaServicesDBEntities())
            {
                string hashedPassword = db.StpUsers.Where(a => a.UserName == username).Select(a=>a.Password).FirstOrDefault();
                return hashedPassword;
            }
        }
        public static int GetUserIDByUsername(string username)
        {
            using (SastaServicesDBEntities db = new SastaServicesDBEntities())
            {
                int ID = db.StpUsers.Where(a => a.UserName == username).Select(a=>a.ID).FirstOrDefault();
                return ID;
            }
        }
        
    }
}