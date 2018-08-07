namespace Cdm.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("concept")]
    public class Concept
    {
        [Column("concept_id")]
        public int Id { get; set; }

        [Column("concept_name")]
        [StringLength(255)]
        public string Name { get; set; }

        [Column("domain_id")]
        [StringLength(20)]
        public string Domain { get; set; }

        [Column("vocabulary_id")]
        [StringLength(20)]
        public string Vocabulary { get; set; }

        [Column("standard_concept")]
        [StringLength(1)]
        public string IsStandardConcept { get; set; }

        [Column("concept_code")]
        [StringLength(50)]
        public string Code { get; set; }

        [Column("valid_start_date")]
        public DateTime ValidStartDate { get; set; }

        [Column("valid_end_date")]
        public DateTime ValidEndDate { get; set; }

        [Column("invalid_reason")]
        [StringLength(1)]
        public string InvalidReason { get; set; }
    }
}
