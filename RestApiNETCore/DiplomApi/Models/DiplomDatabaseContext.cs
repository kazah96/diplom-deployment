using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DiplomApi.Models
{
    public partial class DiplomDatabaseContext : DbContext
    {
        public DiplomDatabaseContext()
        {
        }

        public DiplomDatabaseContext(DbContextOptions<DiplomDatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AccessLevel> AccessLevel { get; set; }
        public virtual DbSet<Action> Action { get; set; }
        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<Document> Document { get; set; }
        public virtual DbSet<DocumentPathHistory> DocumentPathHistory { get; set; }
        public virtual DbSet<DocumentType> DocumentType { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<MonitoringInformation> MonitoringInformation { get; set; }
        public virtual DbSet<Network> Network { get; set; }
        public virtual DbSet<Position> Position { get; set; }
        public virtual DbSet<RoutePoint> RoutePoint { get; set; }
        public virtual DbSet<SecurityInformation> SecurityInformation { get; set; }
        public virtual DbSet<Subdivision> Subdivision { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DESKTOP-Q31V8AK;Database=DiplomDatabase;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AccessLevel>(entity =>
            {
                entity.Property(e => e.AccessLevelId)
                    .HasColumnName("AccessLevelID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AccessName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Action>(entity =>
            {
                entity.Property(e => e.ActionId).HasColumnName("ActionID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDescription)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.Property(e => e.CompanyId).HasColumnName("CompanyID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ContactDetails)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Document>(entity =>
            {
                entity.Property(e => e.DocumentId).HasColumnName("DocumentID");

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DocumentTypeId).HasColumnName("DocumentTypeID");

                entity.Property(e => e.EditsAndChanges)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Path)
                    .IsRequired()
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDiscription)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.HasOne(d => d.DocumentType)
                    .WithMany(p => p.Document)
                    .HasForeignKey(d => d.DocumentTypeId)
                    .HasConstraintName("FK_Document_DocumentTypeID");
            });

            modelBuilder.Entity<DocumentPathHistory>(entity =>
            {
                entity.Property(e => e.DocumentPathHistoryId).HasColumnName("DocumentPathHistoryID");

                entity.Property(e => e.DateAndTimeOfDispatch).HasColumnType("datetime");

                entity.Property(e => e.DateAndTimeOfReceipt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DocumentId).HasColumnName("DocumentID");

                entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.HasOne(d => d.Document)
                    .WithMany(p => p.DocumentPathHistory)
                    .HasForeignKey(d => d.DocumentId)
                    .HasConstraintName("FK_DocumentPathHistory_DocumentID");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.DocumentPathHistory)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_DocumentPathHistory_EmployeeID");
            });

            modelBuilder.Entity<DocumentType>(entity =>
            {
                entity.Property(e => e.DocumentTypeId).HasColumnName("DocumentTypeID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDescription)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

                entity.Property(e => e.CompanyId).HasColumnName("CompanyID");

                entity.Property(e => e.Email)
                    .HasMaxLength(70)
                    .IsUnicode(false);

                entity.Property(e => e.MiddleName)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);

                entity.Property(e => e.PositionId).HasColumnName("PositionID");

                entity.Property(e => e.SubdivisionId).HasColumnName("SubdivisionID");

                entity.Property(e => e.Surname)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.TelephoneNumber)
                    .HasMaxLength(12)
                    .IsUnicode(false);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK_Employee_CompanyID");

                entity.HasOne(d => d.Position)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.PositionId)
                    .HasConstraintName("FK_Employee_PositionID");

                entity.HasOne(d => d.Subdivision)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.SubdivisionId)
                    .HasConstraintName("FK_Employee_SubdivisionID");
            });

            modelBuilder.Entity<MonitoringInformation>(entity =>
            {
                entity.Property(e => e.MonitoringInformationId).HasColumnName("MonitoringInformationID");

                entity.Property(e => e.DocumentId).HasColumnName("DocumentID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.NetworkId).HasColumnName("NetworkID");

                entity.Property(e => e.ShortDescription)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.Document)
                    .WithMany(p => p.MonitoringInformation)
                    .HasForeignKey(d => d.DocumentId)
                    .HasConstraintName("FK_MonitoringInformation_DocumentID");

                entity.HasOne(d => d.Network)
                    .WithMany(p => p.MonitoringInformation)
                    .HasForeignKey(d => d.NetworkId)
                    .HasConstraintName("FK_MonitoringInformation_NetworkID");
            });

            modelBuilder.Entity<Network>(entity =>
            {
                entity.Property(e => e.NetworkId).HasColumnName("NetworkID");

                entity.Property(e => e.CompanyId).HasColumnName("CompanyID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDiscription)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Network)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK_Network_CompanyID");
            });

            modelBuilder.Entity<Position>(entity =>
            {
                entity.Property(e => e.PositionId).HasColumnName("PositionID");

                entity.Property(e => e.AccessLevelId).HasColumnName("AccessLevelID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDescription)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.AccessLevel)
                    .WithMany(p => p.Position)
                    .HasForeignKey(d => d.AccessLevelId)
                    .HasConstraintName("FK_Position_AccessLevel");
            });

            modelBuilder.Entity<RoutePoint>(entity =>
            {
                entity.Property(e => e.RoutePointId).HasColumnName("RoutePointID");

                entity.Property(e => e.ActionId).HasColumnName("ActionID");

                entity.Property(e => e.DocumentTypeId).HasColumnName("DocumentTypeID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PositionId).HasColumnName("PositionID");

                entity.Property(e => e.ShortDescription)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.StageNumber)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Action)
                    .WithMany(p => p.RoutePoint)
                    .HasForeignKey(d => d.ActionId)
                    .HasConstraintName("FK_RoutePoint_ActionID");

                entity.HasOne(d => d.DocumentType)
                    .WithMany(p => p.RoutePoint)
                    .HasForeignKey(d => d.DocumentTypeId)
                    .HasConstraintName("FK_RoutePoint_DocumentTypeID");

                entity.HasOne(d => d.Position)
                    .WithMany(p => p.RoutePoint)
                    .HasForeignKey(d => d.PositionId)
                    .HasConstraintName("FK_RoutePoint_PositionID");
            });

            modelBuilder.Entity<SecurityInformation>(entity =>
            {
                entity.Property(e => e.SecurityInformationId).HasColumnName("SecurityInformationID");

                entity.Property(e => e.DocumentId).HasColumnName("DocumentID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDescription)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.Document)
                    .WithMany(p => p.SecurityInformation)
                    .HasForeignKey(d => d.DocumentId)
                    .HasConstraintName("FK_SecurityInformation_DocumentID");
            });

            modelBuilder.Entity<Subdivision>(entity =>
            {
                entity.Property(e => e.SubdivisionId).HasColumnName("SubdivisionID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
