import { IonFooter, IonTabBar, IonTitle, IonToolbar } from '@ionic/react';
import ToolbarButton from './ToolbarButton';

const BottomToolbar: React.FC = () => {
  return <IonTabBar slot="bottom">
        <ToolbarButton text="Recurring Expenses" onClick={(event) => {
            console.log(`GOTO Recurring Expenses`);
          }}></ToolbarButton>
        <ToolbarButton text="Add Expense" onClick={(event) => {
            console.log(`GOTO Add Expense`);
          }}></ToolbarButton>
        <ToolbarButton text="+\-" onClick={(event) => {
            console.log(`GOTO Dashboard`);
          }}></ToolbarButton>
        <ToolbarButton text="Budget Cap" onClick={(event) => {
            console.log(`GOTO Budget Cap`);
          }}></ToolbarButton>
        <ToolbarButton text="Categories" onClick={(event) => {
            console.log(`GOTO Categories`);
          }}></ToolbarButton>
  </IonTabBar>
};

export default BottomToolbar;
