using Cdm.Models;
using Microsoft.EntityFrameworkCore;

namespace Cdm.EntityFrameworkCore
{
    public class CdmDbContext : DbContext
    {
        public CdmDbContext(DbContextOptions<CdmDbContext> options)
            : base(options)
        {
        }

        public DbSet<Concept> Concepts { get; set; }

        public DbSet<Vocabulary> Vocabularies { get; set; }
    }
}
