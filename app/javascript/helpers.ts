import _scrollIntoView from "scroll-into-view";

export const resolve = <T>(f: () => T): T => f();

export const meta = (name: string): string | undefined => {
  const el = document.head.querySelector(`[name="${name}"][content]`);
  if (el) {
    const content = el.getAttribute("content");
    return content === null ? undefined : content;
  }
};

export const isDebugTarget = (target: string): boolean => {
  const targets = meta("debug");
  return !!targets && targets.split(",").includes(target);
};

export type ScrollIntoViewOptions = {
  margin?: number;
  smooth?: boolean;
};

export const scrollIntoView = (
  target: HTMLElement,
  options?: ScrollIntoViewOptions,
) => {
  const [header] = document.getElementsByTagName("header");
  const headerHeight = header?.clientHeight || 0;
  _scrollIntoView(target, {
    align: {
      top: 0,
      topOffset: headerHeight + (options?.margin || 10),
    },
    time: options?.smooth ? undefined : 0,
  });
};

export const onNextRender = (callback: () => void) => {
  const handler = () => {
    document.removeEventListener("turbo:render", handler);
    callback();
  };
  document.addEventListener("turbo:render", handler);
};
