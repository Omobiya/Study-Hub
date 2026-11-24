import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "StudyHub — Your study space",
  description: "Keep your courses and study resources organized in one private space.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
