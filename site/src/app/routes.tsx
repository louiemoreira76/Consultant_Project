import { createBrowserRouter, Navigate } from "react-router";

// Portal Selection Page
import SelectPortal from "./SelectPortal";

// Backoffice (Admin) Pages


// Frontoffice (Student) Pages
import StudentHome from "./frontoffice/pages/StudentHome";
import TrilhaDetails from "./frontoffice/pages/TrilhaDetails";
import MeuPerfil from "./frontoffice/pages/MeuPerfil";
import MeuProgresso from "./frontoffice/pages/MeuProgresso";

// Shared Components
import { PlaceholderPage } from "./shared/components/PlaceholderPage";
import { FrontPlaceholderPage } from "./shared/components/FrontPlaceholderPage";

import {
  BarChart3,
  MessageSquare,
  Settings,
  BookOpen,
  Play,
  Trophy,
  User,
} from "lucide-react";

export const router = createBrowserRouter([
  {
    path: "/",
    Component: SelectPortal,
  },
  // Frontoffice Routes - Student Area
  {
    path: "/app",
    element: <Navigate to="/app/home" replace />,
  },
  {
    path: "/app/home",
    Component: StudentHome,
  },
  {
    path: "/app/trilha/:id",
    Component: TrilhaDetails,
  },
  {
    path: "/app/perfil",
    Component: MeuPerfil,
  },
  {
    path: "/app/progresso",
    Component: MeuProgresso,
  },
  {
    path: "/app/trilhas",
    element: (
      <FrontPlaceholderPage
        title="Minhas Trilhas"
        description="Acesse todo o conteúdo das suas trilhas ativas"
        icon={BookOpen}
        activeItem="Minhas Trilhas"
      />
    ),
  },
  {
    path: "/app/assistindo",
    element: (
      <FrontPlaceholderPage
        title="Continuar Assistindo"
        description="Retome de onde você parou"
        icon={Play}
        activeItem="Continuar Assistindo"
      />
    ),
  },
  {
    path: "/app/duvidas",
    element: (
      <FrontPlaceholderPage
        title="Dúvidas"
        description="Tire suas dúvidas com a mentora"
        icon={MessageSquare}
        activeItem="Dúvidas"
      />
    ),
  },
  // Legacy redirects for backward compatibility
  {
    path: "/dashboard",
    element: <Navigate to="/admin/dashboard" replace />,
  },
  {
    path: "/trilhas",
    element: <Navigate to="/admin/trilhas" replace />,
  },
  {
    path: "/mentorados",
    element: <Navigate to="/admin/mentorados" replace />,
  },
]);
