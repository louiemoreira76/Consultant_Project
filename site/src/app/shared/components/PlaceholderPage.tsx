import { Sidebar } from '../../backoffice/components/Sidebar';
import { Header } from '../../backoffice/components/Header';
import { LucideIcon } from 'lucide-react';

interface PlaceholderPageProps {
  title: string;
  description: string;
  icon: LucideIcon;
  activeItem: string;
}

export function PlaceholderPage({ title, description, icon: Icon, activeItem }: PlaceholderPageProps) {
  return (
    <div className="min-h-screen bg-[#F0F4F8] font-[Inter,sans-serif]">
      <Sidebar activeItem={activeItem} />

      <div className="ml-64">
        <Header />

        <main className="p-8">
          <div className="bg-white rounded-xl p-12 border border-gray-200 flex items-center justify-center min-h-[500px]">
            <div className="text-center">
              <div className="w-20 h-20 rounded-full bg-[#F0F4F8] mx-auto mb-6 flex items-center justify-center">
                <Icon className="w-10 h-10 text-[#0A2540]" />
              </div>
              <h1 className="text-2xl font-bold text-[#0A2540] mb-2">{title}</h1>
              <p className="text-gray-600 mb-6">{description}</p>
              <div className="inline-block px-4 py-2 bg-[#F0F4F8] rounded-lg text-sm text-gray-600">
                Esta página está em desenvolvimento
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  );
}
