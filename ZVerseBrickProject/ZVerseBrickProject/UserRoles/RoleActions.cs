//<!-----------------------------------------------------------------------------
//* Name: RoleActions.cs
//* Author: Chris Clymer
//* Description: This file creates the admin role and admin account
//------------------------------------------------------------------------------>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZVerseBrickProject.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;


namespace ZVerseBrickProject.UserRoles
{
    internal class RoleActions
    {
        internal void AddUserAndRole()
        {
            // access the application context and create result variables.
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // create roleStore object that can only contain IdentityRole objects by using the ApplicationDbContext object. 
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // create admin role if it doesn't already exist
            if (!roleMgr.RoleExists("admin"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "admin" });
            }

            // create a UserManager object based on the UserStore object and the ApplicationDbContext object.
            // defines admin email account
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "zverse123@gmail.com",
                Email = "zverse123@gmail.com"
            };
            IdUserResult = userMgr.Create(appUser, "Pa$$word1");

            // If the new admin user was successfully created, add the new user to the "admin" role. 
            if (!userMgr.IsInRole(userMgr.FindByEmail("zverse123@gmail.com").Id, "admin"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("zverse123@gmail.com").Id, "admin");
            }
        }
    }
}