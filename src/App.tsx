import { Redirect, Route } from 'react-router-dom';
import { IonTabBar, IonApp, IonRouterOutlet, IonTabs, setupIonicReact } from '@ionic/react';
import { IonReactRouter } from '@ionic/react-router';
import Home from './pages/Home';
import Dashboard from './pages/Dashboard';
import BottomToolbar from './components/BottomToolbar/BottomToolbar';
import ToolbarButton from './components/BottomToolbar/ToolbarButton';

/* Core CSS required for Ionic components to work properly */
import '@ionic/react/css/core.css';

/* Basic CSS for apps built with Ionic */
import '@ionic/react/css/normalize.css';
import '@ionic/react/css/structure.css';
import '@ionic/react/css/typography.css';

/* Optional CSS utils that can be commented out */
import '@ionic/react/css/padding.css';
import '@ionic/react/css/float-elements.css';
import '@ionic/react/css/text-alignment.css';
import '@ionic/react/css/text-transformation.css';
import '@ionic/react/css/flex-utils.css';
import '@ionic/react/css/display.css';

/* Theme variables */
import './theme/variables.css';

setupIonicReact();

const App: React.FC = () => (
  <IonApp>
  <IonReactRouter>
   <IonTabs>
      <IonRouterOutlet>
        <Redirect exact path="/" to="/home" />
        <Route path="/home" render={() => <Home />} exact={true} />
        <Route path="/dashboard" render={() => <Dashboard />} exact={true} />
 
        {/* Fallback to home */}
        <Route>
          <Home />
        </Route>
      </IonRouterOutlet>
      <IonTabBar slot="bottom">
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
    </IonTabs>
  </IonReactRouter>
 </IonApp>
);

export default App;
