import Image from "next/image";

import VideoJsPlayer from "../../components/VideoPlayer";

export default function Home() {
  // Configuration options for the Video.js player
  const playerOptions = {
    autoplay: false,
    controls: true,
    responsive: true,
    fluid: true,
    sources: [
      {
        // The path must point to your master playlist in the /public folder
        src: "http://localhost:8080/master.m3u8",
        type: "application/x-mpegURL", // The MIME type for HLS
      },
    ],
  };

  return (
    <main style={{ padding: "2rem", maxWidth: "800px", margin: "auto" }}>
      <h1>Next.js Video.js Player</h1>
      <VideoJsPlayer options={playerOptions} />
    </main>
  );
}
