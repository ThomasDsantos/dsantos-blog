<template>
  <div>
    <UContainer class="py-16">
      <article class="max-w-3xl mx-auto">
        <!-- Article Header -->
        <header class="mb-12">
          <h1 class="text-4xl md:text-5xl font-bold mb-4">{{ article?.title }}</h1>
          <div class="flex items-center gap-4 text-gray-600 dark:text-gray-400 mb-4">
            <span>{{ formatDate(article?.date) }}</span>
            <span v-if="article?.readingTime">•</span>
            <span v-if="article?.readingTime">{{ article.readingTime }} min de lecture</span>
          </div>
          <div v-if="article?.tags" class="flex items-center gap-2">
            <UBadge
              v-for="tag in article.tags"
              :key="tag"
              variant="subtle"
            >
              {{ tag }}
            </UBadge>
          </div>
        </header>

        <!-- Article Content -->
        <div class="prose prose-slate dark:prose-invert max-w-none">
          <ContentRenderer :value="article" />
        </div>

        <!-- Navigation -->
        <div class="mt-12 pt-8 border-t border-gray-200 dark:border-gray-800">
          <UButton
            to="/blog"
            variant="ghost"
            icon="i-heroicons-arrow-left"
          >
            Retour au blog
          </UButton>
        </div>
      </article>
    </UContainer>
  </div>
</template>

<script setup lang="ts">
const route = useRoute()

const { data: article } = await useAsyncData(`blog-${route.path}`, () =>
  queryContent(route.path).findOne()
)

if (!article.value) {
  throw createError({
    statusCode: 404,
    message: 'Article non trouvé'
  })
}

const formatDate = (date: string) => {
  if (!date) return ''
  return new Date(date).toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

useHead({
  title: article.value?.title,
  meta: [
    { name: 'description', content: article.value?.description }
  ]
})
</script>

<style>
.prose {
  @apply text-gray-700 dark:text-gray-300;
}

.prose h2 {
  @apply text-2xl font-bold mt-8 mb-4;
}

.prose h3 {
  @apply text-xl font-semibold mt-6 mb-3;
}

.prose p {
  @apply mb-4 leading-relaxed;
}

.prose a {
  @apply text-primary underline hover:no-underline;
}

.prose code {
  @apply bg-gray-100 dark:bg-gray-800 px-1.5 py-0.5 rounded text-sm;
}

.prose pre {
  @apply bg-gray-900 text-gray-100 p-4 rounded-lg overflow-x-auto my-6;
}

.prose pre code {
  @apply bg-transparent p-0;
}

.prose ul {
  @apply list-disc list-inside mb-4;
}

.prose ol {
  @apply list-decimal list-inside mb-4;
}

.prose blockquote {
  @apply border-l-4 border-primary pl-4 italic my-6;
}
</style>
