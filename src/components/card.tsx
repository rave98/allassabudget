import React from 'react';
import { IonCard, IonCardContent, IonCardHeader, IonCardSubtitle, IonCardTitle } from '@ionic/react';

function Example() {
  return (
    <IonCard>
      <IonCardHeader>
        <IonCardTitle>All'assa Budget tracker</IonCardTitle>
        <IonCardSubtitle>Sottotitolo di All'assa budget tracker</IonCardSubtitle>
      </IonCardHeader>

      <IonCardContent>
        Contenuto di All'assa Budget Tracker!
      </IonCardContent>
    </IonCard>
  );
}
export default Example;
