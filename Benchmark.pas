{
  Description: Simulated annealing benchmark.

  Copyright (C) 2022 Melchiorre Caruso <melchiorrecaruso@gmail.com>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
}

program Benchmark;

{$mode objfpc}

uses
 {$IFDEF UNIX} cThreads,   {$ENDIF} Classes,
  SimulatedAnnealing,
  SysUtils;

type
  TSimulatedAnnealingBenchmark = class(TSimulatedAnnealing)
  public
    procedure CreateSolution(var Neighbour: tbytes); override;
    function CalculateEnergy(const Solution: tbytes): single; override;
  end;

  TBenchmark = class
  private
    fOptimizer: TSimulatedAnnealing;
  public
    procedure Execute;
  end;

  // math routines

  function HolderTable(const X, Y: double): double;
  begin
    Result := -abs(sin(X) * cos(Y) * exp(abs(1 - sqrt(sqr(X) + sqr(Y)) / pi)));
  end;

  procedure GetXY(const Solution: tbytes; var X, Y: double);
  begin
    X := 2 * (solution[0] * 1 + solution[1] * 0.1 + solution[2] *
      0.01 + solution[3] * 0.001 + solution[4] * 0.0001 - 5);
    Y := 2 * (solution[5] * 1 + solution[6] * 0.1 + solution[7] *
      0.01 + solution[8] * 0.001 + solution[9] * 0.0001 - 5);
  end;

  // TSimulatedAnnealingBenchmark

  procedure TSimulatedAnnealingBenchmark.createsolution(var Neighbour: tbytes);
  begin
    Neighbour[Random(10)] := Random(10);
  end;

  function TSimulatedAnnealingBenchmark.CalculateEnergy(const Solution: tbytes): single;
  var
    X: double;
    Y: double;
  begin
    GetXY(Solution, X, Y);
    Result := HolderTable(X, Y);
  end;

  // TBenchmark

  procedure TBenchmark.Execute;
  var
    i: longint;
    X, Y: double;
    Solution: tbytes = nil;
  begin
    SetLength(Solution, 10);
    for i := Low(Solution) to High(Solution) do
    begin
      Solution[i] := Random(10);
    end;

    fOptimizer := TSimulatedAnnealingBenchmark.Create;
    fOptimizer.InitialTemperature := 100;
    fOptimizer.CoolingRate := 0.001;
    fOptimizer.ExecutionTime := 1;
    fOptimizer.Execute(Solution);
    fOptimizer.Destroy;

    GetXY(Solution, X, Y);
    begin
      Writeln('Simulated Annealing Benchmark');
      Writeln('Holder table function');
      writeln;
      Writeln('X = ', X: 1: 4);
      Writeln('Y = ', Y: 1: 4);
      Writeln('f = ', HolderTable(X, Y): 0: 5);
    end;
    SetLength(Solution, 0);
  end;

  // main block

var
  Bench: TBenchmark;

begin
  Randomize;
  Bench := TBenchmark.Create;
  Bench.Execute;
  Bench.Destroy;
end.
