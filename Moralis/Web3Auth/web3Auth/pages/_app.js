import { MoralisProvider } from "react-moralis";
import "../styles/globals.css";

function MyApp({ Component, pageProps }) {
  return (
    <MoralisProvider serverUrl="https://edmry6aci5ze.usemoralis.com:2053/server" appId="2Iay0HGgZykTjaZhhAgAeCLwzhkUtUvV63LucAX1">
      <Component {...pageProps} />
    </MoralisProvider>
  );
}

export default MyApp;
