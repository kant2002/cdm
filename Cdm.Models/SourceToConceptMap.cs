using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Cdm.Models
{
    [Table("source_to_concept_map")]
    public class SourceToConceptMap
    {
        [Column("source_code")]
        [StringLength(50)]
        [Key]
        public string SourceCode { get; set; }

        [Column("source_concept_id")]
        public int SourceConceptId { get; set; }

        [Column("source_vocabulary_id")]
        [StringLength(20)]
        [Key]
        public string SourceVocabularyId { get; set; }

        [Column("source_code_description")]
        [StringLength(255)]
        public string SourceDescription { get; set; }

        [Column("target_concept_id")]
        [Key]
        public int TargetConceptId { get; set; }

        [Column("target_vocabulary_id")]
        [StringLength(20)]
        public string TargetVocabularyId { get; set; }

        [Column("concept_code")]
        [StringLength(50)]
        public string Code { get; set; }

        [Column("valid_start_date")]
        [Key]
        public DateTime ValidStartDate { get; set; }

        [Column("valid_end_date")]
        public DateTime ValidEndDate { get; set; }

        [Column("invalid_reason")]
        [StringLength(1)]
        public string InvalidReason { get; set; }
    }
}
