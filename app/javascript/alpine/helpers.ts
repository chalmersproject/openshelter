import Alpine from "alpinejs";

export interface AlpineData {
  init?(): void;
  destroy?(): void;
  [stateKey: string]: any;
}

export interface AlpineContext {
  get $el(): HTMLElement;
  get $root(): HTMLElement;
  get $refs(): Record<string, HTMLElement | undefined>;
  get $store(): Record<string, any>;
  $watch(property: string, callback: (value: any, oldValue: any) => void): void;
  $dispatch(type: string, detail?: Record<string, any>): boolean;
  $nextTick(callback: () => void): void;
  $id(name: string): string;
}

export function context(data: AlpineData): AlpineContext {
  return data as AlpineContext;
}

export function register<T, P>(name: string, data: (params: P) => T) {
  Alpine.data(name, data as any);
}
