namespace Cdm.EntityFrameworkCore
{
    public class ICD10Vocabulary : VocabularyRepositoryBase
    {
        public ICD10Vocabulary(CdmDbContext context)
            : base(context, "34")
        {
        }
    }
}
