//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 



import inet.common.geometry.common.OsgGeographicCoordinateSystem;
import inet.environment.common.PhysicalEnvironment;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.AdhocHost;
import inet.node.inet.ManetRouter;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.integrated.IntegratedVisualizer;
import inet.node.inet.INetworkNode;

network aanet
{
    parameters:
        int numPlanes;
        //@figure[rcvdPkText](type=indicatorText; pos=10000,10000; anchor=w; font=,20000; textFormat="Packets Received: %g"; initialValue=0);
        // @statistic[packetReceived](source=ground.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);
    submodules:
        visualizer: IntegratedVisualizer {
            parameters:
                @display("p=920,370");
        }
        coordinateSystem: OsgGeographicCoordinateSystem {
            parameters:
                @display("p=920,90");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=920,160");
        }
        radioMedium: <default("UnitDiskRadioMedium")> like IRadioMedium {
            @display("p=920,230");
        }
        physicalEnvironment: PhysicalEnvironment {
            @display("p=920,300");
        }
        ground: <default("WirelessHost")> like INetworkNode {
            @display("p=38,50;i=device/antennatower");
        }
        host[numPlanes]: ManetRouter {
            @display("p=372,154;i=misc/airplane");
        }
}

