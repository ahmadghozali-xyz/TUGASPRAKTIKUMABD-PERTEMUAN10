import React, { useState } from 'react';
import { Code, Database } from 'lucide-react';

interface SQLExample {
  title: string;
  description: string;
  query: string;
  explanation: string;
}

function App() {
  const [activeTab, setActiveTab] = useState<string>('arithmetic');

  const examples: Record<string, SQLExample[]> = {
    arithmetic: [
      {
        title: "Calculate Yearly Salary",
        description: "Hitung gaji tahunan (Gaji x 12) untuk setiap karyawan",
        query: "SELECT Nama, Jabatan, Gaji,\n       (Gaji * 12) AS Gaji_Tahunan\nFROM Karyawan;",
        explanation: "Mengalikan gaji bulanan dengan 12 untuk mendapatkan gaji tahunan"
      },
      {
        title: "Calculate Salary After Tax",
        description: "Hitung gaji setelah potongan pajak 5%",
        query: "SELECT Nama, Gaji,\n       (Gaji - (Gaji * 0.05)) AS Gaji_Setelah_Pajak\nFROM Karyawan;",
        explanation: "Mengurangi gaji dengan 5% untuk menghitung gaji bersih setelah pajak"
      }
    ],
    aggregate: [
      {
        title: "Total Salary",
        description: "Hitung total gaji seluruh karyawan",
        query: "SELECT SUM(Gaji) AS Total_Gaji\nFROM Karyawan;",
        explanation: "Menjumlahkan seluruh gaji karyawan menggunakan fungsi SUM"
      },
      {
        title: "Average Monthly Salary",
        description: "Berapa rata-rata gaji karyawan per bulan",
        query: "SELECT AVG(Gaji) AS Rata_Rata_Gaji\nFROM Karyawan;",
        explanation: "Menghitung rata-rata gaji menggunakan fungsi AVG"
      }
    ],
    string: [
      {
        title: "Uppercase Names",
        description: "Ubah semua nama karyawan menjadi huruf kapital",
        query: "SELECT UPPER(Nama) AS Nama_Besar\nFROM Karyawan;",
        explanation: "Mengubah teks nama menjadi huruf kapital menggunakan UPPER()"
      },
      {
        title: "Concatenate Name and Position",
        description: "Gabungkan nama dan jabatan",
        query: "SELECT CONCAT(Nama, ' - ', Jabatan) AS Profil_Karyawan\nFROM Karyawan;",
        explanation: "Menggabungkan nama dan jabatan dengan pemisah menggunakan CONCAT()"
      }
    ],
    numeric: [
      {
        title: "Age Modulo",
        description: "Hitung sisa pembagian umur dengan 5",
        query: "SELECT Nama, Umur,\n       MOD(Umur, 5) AS Sisa_Pembagian\nFROM Karyawan;",
        explanation: "Menghitung sisa pembagian umur dengan 5 menggunakan MOD()"
      }
    ],
    datetime: [
      {
        title: "Years of Service",
        description: "Hitung lama bekerja dalam tahun",
        query: "SELECT Nama, Tanggal_Masuk,\n       TIMESTAMPDIFF(YEAR, Tanggal_Masuk, CURDATE()) AS Lama_Bekerja\nFROM Karyawan;",
        explanation: "Menghitung selisih tahun antara tanggal masuk dan saat ini"
      },
      {
        title: "Add One Year",
        description: "Tambahkan 1 tahun ke tanggal masuk",
        query: "SELECT Nama, Tanggal_Masuk,\n       DATE_ADD(Tanggal_Masuk, INTERVAL 1 YEAR) AS Tanggal_Baru\nFROM Karyawan;",
        explanation: "Menambahkan 1 tahun ke tanggal masuk menggunakan DATE_ADD()"
      }
    ]
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow">
        <div className="max-w-7xl mx-auto py-6 px-4">
          <div className="flex items-center gap-2">
            <Database className="h-8 w-8 text-indigo-600" />
            <h1 className="text-3xl font-bold text-gray-900">
              SQL Functions and Operators
            </h1>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto py-6 px-4">
        <div className="flex space-x-4 mb-6 overflow-x-auto">
          {Object.keys(examples).map((tab) => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={`px-4 py-2 rounded-lg font-medium ${
                activeTab === tab
                  ? 'bg-indigo-600 text-white'
                  : 'bg-white text-gray-600 hover:bg-gray-50'
              }`}
            >
              {tab.charAt(0).toUpperCase() + tab.slice(1)}
            </button>
          ))}
        </div>

        <div className="space-y-6">
          {examples[activeTab].map((example, index) => (
            <div
              key={index}
              className="bg-white rounded-lg shadow overflow-hidden"
            >
              <div className="p-6">
                <h2 className="text-xl font-semibold text-gray-900 mb-2">
                  {example.title}
                </h2>
                <p className="text-gray-600 mb-4">{example.description}</p>
                <div className="bg-gray-50 rounded-lg p-4 mb-4">
                  <div className="flex items-center gap-2 mb-2">
                    <Code className="h-5 w-5 text-indigo-600" />
                    <h3 className="font-medium text-gray-900">Query</h3>
                  </div>
                  <pre className="bg-gray-900 text-gray-100 rounded-lg p-4 overflow-x-auto">
                    <code>{example.query}</code>
                  </pre>
                </div>
                <div className="text-gray-600">
                  <strong className="text-gray-900">Explanation:</strong>{' '}
                  {example.explanation}
                </div>
              </div>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}

export default App;