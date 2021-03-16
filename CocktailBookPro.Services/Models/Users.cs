using System;
using System.Collections.Generic;

namespace CocktailBookPro.Services.Models
{
    public partial class Users
    {
        public Users()
        {
            RecipeComments = new HashSet<RecipeComments>();
            Recipes = new HashSet<Recipes>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public DateTime Birthdate { get; set; }
        public string Email { get; set; }
        public string MobilePhone { get; set; }
        public string PasswordHash { get; set; }

        public virtual Logins Logins { get; set; }
        public virtual ICollection<RecipeComments> RecipeComments { get; set; }
        public virtual ICollection<Recipes> Recipes { get; set; }
    }
}
