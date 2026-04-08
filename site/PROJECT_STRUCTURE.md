# LT Tax - Estrutura do Projeto

## Visão Geral

Este projeto está separado em **Backoffice** (área administrativa) e **Frontoffice** (portal do aluno).

## Estrutura de Diretórios

```
src/app/
├── backoffice/              # Área Administrativa (Mentora)
│   ├── pages/               # Páginas do backoffice
│   │   ├── Dashboard.tsx
│   │   ├── TrailManagement.tsx
│   │   └── Mentorados.tsx
│   └── components/          # Componentes do backoffice
│       ├── Sidebar.tsx
│       ├── Header.tsx
│       ├── KPICard.tsx
│       ├── StudentTable.tsx
│       ├── TrailCard.tsx
│       ├── ChatWidget.tsx
│       ├── TrailListPanel.tsx
│       ├── ContentPanel.tsx
│       ├── ContentCard.tsx
│       ├── AddTrailModal.tsx
│       ├── AddContentModal.tsx
│       └── BackofficeLayout.tsx
│
├── frontoffice/             # Portal do Aluno
│   ├── pages/               # Páginas do frontoffice
│   │   └── StudentHome.tsx
│   └── components/          # Componentes do frontoffice
│       ├── StudentSidebar.tsx
│       ├── StudentHeader.tsx
│       └── FrontofficeLayout.tsx
│
├── shared/                  # Componentes Compartilhados
│   └── components/
│       └── PlaceholderPage.tsx
│
├── components/ui/           # UI Components (shadcn/ui)
│
├── SelectPortal.tsx         # Página de seleção de portal
└── App.tsx                  # Configuração de rotas
```

## Rotas do Sistema

### Portal de Seleção
- `/` - Página inicial para escolher entre backoffice ou frontoffice

### Backoffice (Área Administrativa) - Prefixo `/admin`
- `/admin/dashboard` - Dashboard administrativo
- `/admin/trilhas` - Gerenciamento de trilhas de conteúdo
- `/admin/mentorados` - Gestão de alunos
- `/admin/relatorios` - Relatórios e análises
- `/admin/chat` - Chat de suporte
- `/admin/configuracoes` - Configurações da plataforma

### Frontoffice (Portal do Aluno) - Prefixo `/app`
- `/app/home` - Página inicial do aluno
- `/app/trilhas` - Minhas trilhas
- `/app/assistindo` - Continuar assistindo
- `/app/progresso` - Meu progresso
- `/app/duvidas` - Tirar dúvidas
- `/app/perfil` - Meu perfil

### Rotas Legacy (Redirecionamento)
- `/dashboard` → `/admin/dashboard`
- `/trilhas` → `/admin/trilhas`
- `/mentorados` → `/admin/mentorados`

## Características de Cada Área

### Backoffice
- **Design**: Azul marinho profundo (#0A2540) + Dourado (#D4AF37)
- **Público**: Mentora/Administradora
- **Funcionalidades**:
  - Dashboard com KPIs
  - CRUD completo de trilhas e conteúdos
  - Monitoramento de alunos
  - Análise de engajamento
  - Gestão de dúvidas

### Frontoffice
- **Design**: Clean, foco em aprendizado
- **Público**: Alunos/Mentorados
- **Funcionalidades**:
  - Visualização de trilhas
  - Player de vídeo
  - Acompanhamento de progresso
  - Envio de dúvidas
  - Perfil pessoal

## Paleta de Cores

### Backoffice
- Azul Marinho: `#0A2540`
- Cinza Gelo: `#F0F4F8`
- Dourado: `#D4AF37`

### Frontoffice
- Primária: `#0A2540`
- Secundária: Gradientes azul/roxo/verde
- Background: `#F9FAFB`

## Tecnologias

- React 18
- TypeScript
- React Router v7
- Tailwind CSS v4
- Recharts (gráficos)
- Lucide React (ícones)
- Radix UI (componentes)

## Como Navegar

1. Acesse `/` para ver a página de seleção
2. Clique em "Área Administrativa" para acessar o backoffice
3. Clique em "Portal do Aluno" para acessar o frontoffice

## Desenvolvimento

Para adicionar novas páginas:

**Backoffice**: Criar em `backoffice/pages/` e adicionar rota em `App.tsx` com prefixo `/admin`
**Frontoffice**: Criar em `frontoffice/pages/` e adicionar rota em `App.tsx` com prefixo `/app`
**Compartilhado**: Criar em `shared/components/` para componentes usados em ambas as áreas
