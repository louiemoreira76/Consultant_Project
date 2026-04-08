import { Sidebar } from '../components/Sidebar';
import { Header } from '../components/Header';

// Mentorados Management Page - Backoffice
function Mentorados() {
  return (
    <div className="min-h-screen bg-[#F0F4F8] font-[Inter,sans-serif]">
      <Sidebar activeItem="Mentorados" />

      <div className="ml-64">
        <Header />

        <main className="p-8">
          <div className="bg-white rounded-xl p-12 border border-gray-200 flex items-center justify-center min-h-[500px]">
            <h1 className="text-6xl font-bold text-[#0A2540]">italo</h1>
          </div>
        </main>
      </div>
    </div>
  );
}

export default Mentorados;
