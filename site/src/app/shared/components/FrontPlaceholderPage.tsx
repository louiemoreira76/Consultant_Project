import { FrontofficeLayout } from '../../frontoffice/components/FrontofficeLayout';
import { LucideIcon } from 'lucide-react';

interface FrontPlaceholderPageProps {
  title: string;
  description: string;
  icon: LucideIcon;
  activeItem: string;
}

export function FrontPlaceholderPage({ title, description, icon: Icon, activeItem }: FrontPlaceholderPageProps) {
  return (
    <FrontofficeLayout activeItem={activeItem}>
      <div className="bg-white rounded-xl p-12 border border-gray-200 flex items-center justify-center min-h-[500px]">
        <div className="text-center">
          <div className="w-20 h-20 rounded-full bg-gray-50 mx-auto mb-6 flex items-center justify-center">
            <Icon className="w-10 h-10 text-[#0A2540]" />
          </div>
          <h1 className="text-2xl font-bold text-[#0A2540] mb-2">{title}</h1>
          <p className="text-gray-600 mb-6">{description}</p>
          <div className="inline-block px-4 py-2 bg-blue-50 rounded-lg text-sm text-blue-700">
            Esta página está em desenvolvimento
          </div>
        </div>
      </div>
    </FrontofficeLayout>
  );
}
