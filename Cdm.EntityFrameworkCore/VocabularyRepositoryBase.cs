using Cdm.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace Cdm.EntityFrameworkCore
{
    public abstract class VocabularyRepositoryBase
    {
        private readonly string vocabularyId;

        protected VocabularyRepositoryBase(CdmDbContext context, string vocabularyId)
        {
            if (string.IsNullOrWhiteSpace(vocabularyId))
            {
                throw new ArgumentException("message", nameof(vocabularyId));
            }

            this.Context = context ?? throw new ArgumentNullException(nameof(context));
            this.vocabularyId = vocabularyId;
        }

        protected CdmDbContext Context { get; }

        protected async Task<Concept> FindConceptById(int id)
            => await this.Context.Concepts
                .FirstOrDefaultAsync(_ => _.Id == id && _.Vocabulary == this.vocabularyId)
                .ConfigureAwait(false);

        protected async Task<Concept> FindConceptByCode(string code)
            => await this.Context.Concepts
                .FirstOrDefaultAsync(_ => _.Code == code && _.Vocabulary == this.vocabularyId)
                .ConfigureAwait(false);
    }
}
