using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ProjectFinal.Models
{
    public partial class MWMSystemContext : DbContext
    {
        public MWMSystemContext()
        {
        }

        public MWMSystemContext(DbContextOptions<MWMSystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Billed> Billeds { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<ImportProduct> ImportProducts { get; set; } = null!;
        public virtual DbSet<InforImport> InforImports { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductReturnImport> ProductReturnImports { get; set; } = null!;
        public virtual DbSet<ProductType> ProductTypes { get; set; } = null!;
        public virtual DbSet<ProductsInBill> ProductsInBills { get; set; } = null!;
        public virtual DbSet<ProductsReturn> ProductsReturns { get; set; } = null!;
        public virtual DbSet<Return> Returns { get; set; } = null!;
        public virtual DbSet<ReturnImportProduct> ReturnImportProducts { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Supplier> Suppliers { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server=DESKTOP-PVD65DI;database=MWMSystem;uid=sa;password=123456;Integrated Security=True;TrustServerCertificate=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Billed>(entity =>
            {
                entity.ToTable("Billed");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.DateImport).HasColumnType("date");

                entity.Property(e => e.Debt).HasColumnType("money");

                entity.Property(e => e.Deposit).HasColumnType("money");

                entity.Property(e => e.Idcustomer).HasColumnName("IDCustomer");

                entity.Property(e => e.TotalBill).HasColumnType("money");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdcustomerNavigation)
                    .WithMany(p => p.Billeds)
                    .HasForeignKey(d => d.Idcustomer)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Billed_Customer");

                entity.HasOne(d => d.UsernameNavigation)
                    .WithMany(p => p.Billeds)
                    .HasForeignKey(d => d.Username)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Billed_User");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("Customer");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Address).HasMaxLength(300);

                entity.Property(e => e.Dob).HasColumnType("date");

                entity.Property(e => e.Email)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.Note).HasMaxLength(300);

                entity.Property(e => e.Phone)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ImportProduct>(entity =>
            {
                entity.ToTable("ImportProduct");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CodeImport)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.DateImport).HasColumnType("date");

                entity.Property(e => e.TotalBill).HasColumnType("money");

                entity.Property(e => e.UserName)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("userName");

                entity.HasOne(d => d.SupplierNavigation)
                    .WithMany(p => p.ImportProducts)
                    .HasForeignKey(d => d.Supplier)
                    .HasConstraintName("FK_ImportProduct_Supplier");

                entity.HasOne(d => d.UserNameNavigation)
                    .WithMany(p => p.ImportProducts)
                    .HasForeignKey(d => d.UserName)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ImportProduct_User");
            });

            modelBuilder.Entity<InforImport>(entity =>
            {
                entity.HasKey(e => new { e.Idimport, e.Idproduct });

                entity.ToTable("InforImport");

                entity.Property(e => e.Idimport).HasColumnName("IDImport");

                entity.Property(e => e.Idproduct).HasColumnName("IDProduct");

                entity.Property(e => e.DateExpiry).HasColumnType("date");

                entity.Property(e => e.DateImport).HasColumnType("date");

                entity.Property(e => e.ImportPrice).HasColumnType("money");

                entity.Property(e => e.Shelves)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdimportNavigation)
                    .WithMany(p => p.InforImports)
                    .HasForeignKey(d => d.Idimport)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InforImport_ImportProduct");

                entity.HasOne(d => d.IdproductNavigation)
                    .WithMany(p => p.InforImports)
                    .HasForeignKey(d => d.Idproduct)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InforImport_Product");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.InforImports)
                    .HasForeignKey(d => d.SupplierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InforImport_Supplier");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.Producer).HasMaxLength(250);

                entity.Property(e => e.SalePrice).HasColumnType("money");

                entity.Property(e => e.TotalSales).HasColumnType("money");

                entity.Property(e => e.Unit).HasMaxLength(250);

                entity.HasOne(d => d.ProductTypeNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ProductType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductType_Table_1");
            });

            modelBuilder.Entity<ProductReturnImport>(entity =>
            {
                entity.HasKey(e => new { e.Idreturn, e.Idproduct, e.Idimport });

                entity.ToTable("ProductReturnImport");

                entity.Property(e => e.Idreturn).HasColumnName("IDReturn");

                entity.Property(e => e.Idproduct).HasColumnName("IDProduct");

                entity.Property(e => e.Idimport).HasColumnName("IDImport");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.HasOne(d => d.IdreturnNavigation)
                    .WithMany(p => p.ProductReturnImports)
                    .HasForeignKey(d => d.Idreturn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductReturnImport_ReturnImportProduct");

                entity.HasOne(d => d.Id)
                    .WithMany(p => p.ProductReturnImports)
                    .HasForeignKey(d => new { d.Idimport, d.Idproduct })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductReturnImport_InforImport");
            });

            modelBuilder.Entity<ProductType>(entity =>
            {
                entity.ToTable("ProductType");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<ProductsInBill>(entity =>
            {
                entity.HasKey(e => new { e.Idbill, e.Idproduct });

                entity.ToTable("ProductsInBill");

                entity.Property(e => e.Idbill).HasColumnName("IDBill");

                entity.Property(e => e.Idproduct).HasColumnName("IDProduct");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.HasOne(d => d.IdbillNavigation)
                    .WithMany(p => p.ProductsInBills)
                    .HasForeignKey(d => d.Idbill)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductsInBill_Billed");

                entity.HasOne(d => d.IdproductNavigation)
                    .WithMany(p => p.ProductsInBills)
                    .HasForeignKey(d => d.Idproduct)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductsInBill_Product");
            });

            modelBuilder.Entity<ProductsReturn>(entity =>
            {
                entity.HasKey(e => new { e.Idreturn, e.Idbill, e.Idproduct });

                entity.ToTable("ProductsReturn");

                entity.Property(e => e.Idreturn).HasColumnName("IDReturn");

                entity.Property(e => e.Idbill).HasColumnName("IDBill");

                entity.Property(e => e.Idproduct).HasColumnName("IDProduct");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.HasOne(d => d.IdreturnNavigation)
                    .WithMany(p => p.ProductsReturns)
                    .HasForeignKey(d => d.Idreturn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductsReturn_Return");

                entity.HasOne(d => d.Id)
                    .WithMany(p => p.ProductsReturns)
                    .HasForeignKey(d => new { d.Idbill, d.Idproduct })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductsReturn_ProductsInBill");
            });

            modelBuilder.Entity<Return>(entity =>
            {
                entity.ToTable("Return");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.Idbill).HasColumnName("IDBill");

                entity.Property(e => e.Idcustomer).HasColumnName("IDCustomer");

                entity.Property(e => e.Totalbill)
                    .HasColumnType("money")
                    .HasColumnName("totalbill");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.IdbillNavigation)
                    .WithMany(p => p.Returns)
                    .HasForeignKey(d => d.Idbill)
                    .HasConstraintName("FK_Return_Billed");

                entity.HasOne(d => d.IdcustomerNavigation)
                    .WithMany(p => p.Returns)
                    .HasForeignKey(d => d.Idcustomer)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Return_Customer");

                entity.HasOne(d => d.UsernameNavigation)
                    .WithMany(p => p.Returns)
                    .HasForeignKey(d => d.Username)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Return_User");
            });

            modelBuilder.Entity<ReturnImportProduct>(entity =>
            {
                entity.ToTable("ReturnImportProduct");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.Idimport).HasColumnName("IDImport");

                entity.Property(e => e.Totalbill)
                    .HasColumnType("money")
                    .HasColumnName("totalbill");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.IdimportNavigation)
                    .WithMany(p => p.ReturnImportProducts)
                    .HasForeignKey(d => d.Idimport)
                    .HasConstraintName("FK_ReturnImportProduct_ImportProduct");

                entity.HasOne(d => d.SuppilerNavigation)
                    .WithMany(p => p.ReturnImportProducts)
                    .HasForeignKey(d => d.Suppiler)
                    .HasConstraintName("FK_ReturnImportProduct_Supplier");

                entity.HasOne(d => d.UsernameNavigation)
                    .WithMany(p => p.ReturnImportProducts)
                    .HasForeignKey(d => d.Username)
                    .HasConstraintName("FK_ReturnImportProduct_User");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.Name)
                    .HasMaxLength(150)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.ToTable("Supplier");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Address).HasMaxLength(300);

                entity.Property(e => e.Email)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.Phone)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Username);

                entity.ToTable("User");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.Address).HasMaxLength(150);

                entity.Property(e => e.Email)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.Image)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(300);

                entity.Property(e => e.Password)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.Phone)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.RoleNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Role)
                    .HasConstraintName("FK_User_Role");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
