import { IonContent, IonHeader, IonItem, IonLabel, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import './Home.css';

const Home: React.FC = () => {
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>AAA Budget track</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">AAA Budget track</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonItem routerLink="/dashboard">
          <IonLabel>
            Go to dashboard
          </IonLabel>
        </IonItem>
      </IonContent>
    </IonPage>
  );
};

export default Home;
