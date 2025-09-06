// components/VideoJsPlayer.js

"use client"; // This component runs on the client-side

import React, { useEffect, useRef } from "react";
import videojs from "video.js";
import "video.js/dist/video-js.css"; // Import the default CSS
import "videojs-hls-quality-selector";
//ads
export default function VideoJsPlayer({ options }) {
  const videoRef = useRef(null); // Ref for the <video> element
  const playerRef = useRef(null); // Ref for the Video.js player instance

  useEffect(() => {
    // Make sure we only initialize the player once
    if (!playerRef.current && videoRef.current) {
      const player = videojs(videoRef.current, options, () => {
        console.log("Player is ready");
      });
      playerRef.current = player;
      player.hlsQualitySelector({
        displayCurrentQuality: true,
      });
    }

    // Cleanup function: dispose of the player when the component unmounts
    return () => {
      const player = playerRef.current;
      if (player && !player.isDisposed()) {
        player.dispose();
        playerRef.current = null;
      }
    };
  }, [options, videoRef]);

  return (
    <div data-vjs-player>
      <video ref={videoRef} className="video-js vjs-big-play-centered" />
    </div>
  );
}
