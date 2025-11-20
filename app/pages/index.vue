<template>
  <div>
    <!-- Hero Section -->
    <UContainer class="py-16 md:py-24">
      <div class="max-w-3xl mx-auto text-center">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">
          Salut, je suis <span class="text-primary">Thomas Dsantos</span>
        </h1>
        <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 mb-8">
          Software developer, Devops enjoyer 🌱
        </p>
        <p class="text-md text-gray-500 dark:text-gray-500 mb-8">
          📍 Paris, France • @Numberly
        </p>
        <div class="flex items-center justify-center gap-4">
          <UButton to="/portfolio" size="lg" icon="i-heroicons-briefcase">
            Voir mon portfolio
          </UButton>
          <UButton to="/blog" size="lg" variant="outline" icon="i-heroicons-document-text">
            Lire le blog
          </UButton>
        </div>
      </div>
    </UContainer>

    <!-- About Section -->
    <UContainer class="py-16 border-t border-gray-200 dark:border-gray-800">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-3xl font-bold mb-8">À propos de moi</h2>
        <div class="grid md:grid-cols-2 gap-8">
          <div>
            <p class="text-gray-600 dark:text-gray-400 mb-4">
              Développeur Full-Stack passionné par les technologies modernes et DevOps.
              Je travaille actuellement chez <strong>Numberly</strong> à Paris, où je conçois
              et développe des solutions web performantes et scalables.
            </p>
            <p class="text-gray-600 dark:text-gray-400 mb-4">
              J'ai une expertise particulière en <strong>Rust</strong> et <strong>Go</strong>
              pour le backend, ainsi qu'en <strong>Vue.js/Nuxt</strong> pour le frontend.
              Passionné par l'automatisation et l'infrastructure as code avec <strong>Nix</strong>.
            </p>
            <p class="text-gray-600 dark:text-gray-400">
              Je contribue régulièrement à l'open source et je partage mes connaissances
              à travers mon blog et mes projets sur GitHub.
            </p>
          </div>
          <div>
            <h3 class="font-semibold mb-4">Technologies que j'utilise</h3>
            <div class="flex flex-wrap gap-2">
              <UBadge v-for="tech in technologies" :key="tech" size="lg" variant="subtle">
                {{ tech }}
              </UBadge>
            </div>
          </div>
        </div>
      </div>
    </UContainer>

    <!-- Latest Posts Section -->
    <UContainer class="py-16 border-t border-gray-200 dark:border-gray-800">
      <div class="max-w-4xl mx-auto">
        <div class="flex items-center justify-between mb-8">
          <h2 class="text-3xl font-bold">Derniers articles</h2>
          <UButton to="/blog" variant="ghost" trailing-icon="i-heroicons-arrow-right">
            Voir tous les articles
          </UButton>
        </div>
        <div class="grid md:grid-cols-2 gap-6">
          <UCard
            v-for="article in latestArticles"
            :key="article._path"
            class="hover:shadow-lg transition-shadow"
          >
            <template #header>
              <h3 class="text-xl font-semibold">{{ article.title }}</h3>
            </template>
            <p class="text-gray-600 dark:text-gray-400 line-clamp-3">
              {{ article.description }}
            </p>
            <template #footer>
              <div class="flex items-center justify-between">
                <span class="text-sm text-gray-500">{{ formatDate(article.date) }}</span>
                <UButton
                  :to="article._path"
                  variant="ghost"
                  trailing-icon="i-heroicons-arrow-right"
                >
                  Lire plus
                </UButton>
              </div>
            </template>
          </UCard>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<script setup lang="ts">
const technologies = [
  'Rust',
  'Go',
  'Vue.js',
  'Nuxt',
  'TypeScript',
  'Node.js',
  'Nix',
  'Docker',
  'PostgreSQL',
  'Tailwind CSS',
  'Lua'
]

const { data: latestArticles } = await useAsyncData('latest-articles', () =>
  queryContent('/blog').sort({ date: -1 }).limit(4).find()
)

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}
</script>
