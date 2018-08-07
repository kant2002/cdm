namespace Cdm.EntityFrameworkCore
{
    public class RxNormVocabulary : VocabularyRepositoryBase
    {
        public RxNormVocabulary(CdmDbContext context)
            : base(context, "8")
        {
        }
    }
}
