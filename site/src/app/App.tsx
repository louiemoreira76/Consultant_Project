import {
  BrowserRouter,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import {
  BarChart3,
  MessageSquare,
  Settings,
  BookOpen,
  Play,
  Trophy,
  User,
} from "lucide-react";

// Portal Selection Page
import SelectPortal from "./SelectPortal";

// Backoffice (Admin) Pages
import Dashboard from "./backoffice/pages/Dashboard";
import TrailManagement from "./backoffice/pages/TrailManagement";
import Mentorados from "./backoffice/pages/Mentorados";

// Frontoffice (Student) Pages
import StudentHome from "./frontoffice/pages/StudentHome";

// Shared Components
import { PlaceholderPage } from "./shared/components/PlaceholderPage";
import { FrontPlaceholderPage } from "./shared/components/FrontPlaceholderPage";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        {/* Root - Portal Selection */}
        <Route path="/" element={<SelectPortal />} />

        {/* Backoffice Routes - Admin Area */}
        <Route path="/admin">
          <Route index element={<Navigate to="/admin/dashboard" replace />} />
          <Route path="dashboard" element={<Dashboard />} />
          <Route path="trilhas" element={<TrailManagement />} />
          <Route path="mentorados" element={<Mentorados />} />
          <Route
            path="relatorios"
            element={
              <PlaceholderPage
                title="Relatórios"
                description="Análises detalhadas de desempenho e engajamento"
                icon={BarChart3}
                activeItem="Relatórios"
              />
            }
          />
          <Route
            path="chat"
            element={
              <PlaceholderPage
                title="Chat de Suporte"
                description="Central de atendimento e suporte aos mentorados"
                icon={MessageSquare}
                activeItem="Chat de Suporte"
              />
            }
          />
          <Route
            path="configuracoes"
            element={
              <PlaceholderPage
                title="Configurações"
                description="Personalize sua plataforma e preferências"
                icon={Settings}
                activeItem="Configurações"
              />
            }
          />
        </Route>

        {/* Frontoffice Routes - Student Area */}
        <Route path="/app">
          <Route index element={<Navigate to="/app/home" replace />} />
          <Route path="home" element={<StudentHome />} />
          <Route
            path="trilhas"
            element={
              <FrontPlaceholderPage
                title="Minhas Trilhas"
                description="Acesse todo o conteúdo das suas trilhas ativas"
                icon={BookOpen}
                activeItem="Minhas Trilhas"
              />
            }
          />
          <Route
            path="assistindo"
            element={
              <FrontPlaceholderPage
                title="Continuar Assistindo"
                description="Retome de onde você parou"
                icon={Play}
                activeItem="Continuar Assistindo"
              />
            }
          />
          <Route
            path="progresso"
            element={
              <FrontPlaceholderPage
                title="Meu Progresso"
                description="Acompanhe sua evolução e conquistas"
                icon={Trophy}
                activeItem="Meu Progresso"
              />
            }
          />
          <Route
            path="duvidas"
            element={
              <FrontPlaceholderPage
                title="Dúvidas"
                description="Tire suas dúvidas com a mentora"
                icon={MessageSquare}
                activeItem="Dúvidas"
              />
            }
          />
          <Route
            path="perfil"
            element={
              <FrontPlaceholderPage
                title="Meu Perfil"
                description="Gerencie suas informações pessoais"
                icon={User}
                activeItem="Meu Perfil"
              />
            }
          />
        </Route>

        {/* Legacy redirects for backward compatibility */}
        <Route path="/dashboard" element={<Navigate to="/admin/dashboard" replace />} />
        <Route path="/trilhas" element={<Navigate to="/admin/trilhas" replace />} />
        <Route path="/mentorados" element={<Navigate to="/admin/mentorados" replace />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
