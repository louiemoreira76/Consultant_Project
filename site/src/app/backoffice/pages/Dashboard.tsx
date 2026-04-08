import { Users, TrendingUp, Play, MessageCircle } from 'lucide-react';
import { Sidebar } from '../components/Sidebar';
import { Header } from '../components/Header';
import { KPICard } from '../components/KPICard';
import { StudentTable } from '../components/StudentTable';
import { TrailCards } from '../components/TrailCard';
import { ChatWidget } from '../components/ChatWidget';

// Mock data for KPI engagement chart
const engagementData = [
  { value: 65 },
  { value: 72 },
  { value: 68 },
  { value: 75 },
  { value: 82 },
  { value: 78 },
  { value: 85 },
];

function Dashboard() {
  return (
    <div className="min-h-screen bg-[#F0F4F8] font-[Inter,sans-serif]">
      {/* Sidebar OKKKKKKKKKKKKKKKKKKKKK*/ }
      <Sidebar activeItem="Dashboard" />

      {/* Main Content */}
      <div className="ml-64">
        {/* Header okkkkkkkkkkkkkkk*/}
        <Header />

        {/* Main Content Area */}
        <main className="p-8">
          {/* KPI Cards okkkkkkkkkkkk*/}
          <div className="grid grid-cols-4 gap-6 mb-8">
            <KPICard
              title="Total de Mentorados"
              value="247"
              icon={Users}
              trend="up"
              trendValue="+12% este mês"
            />
            <KPICard
              title="Taxa de Engajamento"
              value="85%"
              icon={TrendingUp}
              trend="up"
              trendValue="+5.2%"
              showChart={true}
              chartData={engagementData}
            />
            <KPICard
              title="Aulas Assistidas (Hoje)"
              value="142"
              icon={Play}
              trend="up"
              trendValue="+18"
            />
            <KPICard
              title="Dúvidas Pendentes"
              value="8"
              icon={MessageCircle}
              alert={true}
            />
          </div>

          {/* Main Content Grid */}
          <div className="grid grid-cols-3 gap-6 mb-8">
            {/* Student Table - Takes 2 columns okkkkkkkkkkkkkkkkkkkkkkkkkkkkk*/}
            <div className="col-span-2">
              <StudentTable />
            </div>

            {/* Trail Cards - Takes 1 column okkkkkkkkkkkkkk*/}
            <div>
              <TrailCards />
            </div>
          </div>

          {/* Chat Widget */}
          <div className="max-w-2xl">
            <ChatWidget />
          </div>
        </main>
      </div>
    </div>
  );
}

export default Dashboard;
