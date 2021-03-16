using System;
using System.Collections.Generic;

namespace CocktailBookPro.Services.Models
{
    public partial class Logins
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }

        public virtual Users IdNavigation { get; set; }
    }
}
