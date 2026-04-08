import { LucideIcon } from 'lucide-react';
import { LineChart, Line, ResponsiveContainer } from 'recharts';

interface KPICardProps {
  title: string;
  value: string | number;
  icon: LucideIcon;
  trend?: 'up' | 'down' | 'neutral';
  trendValue?: string;
  showChart?: boolean;
  chartData?: { value: number }[];
  alert?: boolean;
}

export function KPICard({ 
  title, 
  value, 
  icon: Icon, 
  trend, 
  trendValue,
  showChart = false,
  chartData = [],
  alert = false
}: KPICardProps) {
  return (
    <div className="bg-white rounded-xl p-6 shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <p className="text-sm text-gray-600 mb-1">{title}</p>
          <p className={`text-3xl font-semibold ${alert ? 'text-red-600' : 'text-[#0A2540]'}`}>
            {value}
          </p>
          {trendValue && (
            <div className="flex items-center gap-1 mt-2">
              <span className={`text-sm ${
                trend === 'up' ? 'text-green-600' : 
                trend === 'down' ? 'text-red-600' : 
                'text-gray-600'
              }`}>
                {trend === 'up' ? '↑' : trend === 'down' ? '↓' : '→'} {trendValue}
              </span>
            </div>
          )}
        </div>
        
        <div className={`p-3 rounded-lg ${alert ? 'bg-red-50' : 'bg-[#F0F4F8]'}`}>
          <Icon className={`w-6 h-6 ${alert ? 'text-red-600' : 'text-[#0A2540]'}`} />
        </div>
      </div>

      {showChart && chartData.length > 0 && (
        <div className="mt-4" style={{ height: '48px', minHeight: '48px' }}>
          <ResponsiveContainer width="100%" height={48}>
            <LineChart data={chartData}>
              <Line
                type="monotone"
                dataKey="value"
                stroke="#0A2540"
                strokeWidth={2}
                dot={false}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      )}
    </div>
  );
}
