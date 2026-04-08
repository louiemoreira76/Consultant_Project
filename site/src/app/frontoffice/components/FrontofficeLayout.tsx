import { ReactNode } from 'react';
import { StudentSidebar } from './StudentSidebar';
import { StudentHeader } from './StudentHeader';

interface FrontofficeLayoutProps {
  children: ReactNode;
  activeItem?: string;
}

export function FrontofficeLayout({ children, activeItem }: FrontofficeLayoutProps) {
  return (
    <div className="min-h-screen bg-gray-50 font-[Inter,sans-serif]">
      <StudentSidebar activeItem={activeItem} />

      <div className="ml-64">
        <StudentHeader />

        <main className="p-8">
          {children}
        </main>
      </div>
    </div>
  );
}
