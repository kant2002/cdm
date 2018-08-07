using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Cdm.Models
{
    [Table("vocabulary")]
    public class Vocabulary
    {
        [Column("vocabulary_id")]
        [StringLength(20)]
        [Key]
        public string Id { get; set; }

        [Column("vocabulary_name")]
        [StringLength(255)]
        public string Name { get; set; }

        [Column("vocabulary_reference")]
        [StringLength(255)]
        public string Reference { get; set; }

        [Column("vocabulary_version")]
        [StringLength(255)]
        public string Version { get; set; }

        [Column("vocabulary_concept_id")]
        public int VocabularyConceptId { get; set; }
    }
}
